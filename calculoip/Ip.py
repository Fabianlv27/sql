import ipaddress
import math
import keyboard
import threading
import os
INPUT_FILE = os.path.join(os.getcwd(), 'subnets.txt')

FORMAT_BASE = 'Base:'
FORMAT_ROUTER = 'RouterCount:'
FORMAT_SUBNET = 'Subnet:'


def parse_requirements(lines):
    base = None
    router_count = 0
    reqs = []
    for text in lines:
        text = text.strip()
        if text.startswith(FORMAT_BASE):
            base = text.split(FORMAT_BASE,1)[1].strip()
        elif text.startswith(FORMAT_ROUTER):
            router_count = int(text.split(FORMAT_ROUTER,1)[1].strip())
        elif text.startswith(FORMAT_SUBNET):
            parts = text.split(FORMAT_SUBNET,1)[1].split(',')
            name = parts[0].strip()
            devs = int(parts[1].strip())
            reqs.append([name, devs, False])
    for j in range(1, router_count+1):
        idx = -j
        reqs[idx][2] = True
    return base, reqs


def calculate_subnets(base_network_str, requirements):
    base_net = ipaddress.IPv4Network(base_network_str, strict=False)
    enriched = []
    for idx, (name, devs, is_router) in enumerate(requirements):
        extra = 2 if is_router else 3
        total_hosts = devs + extra
        host_bits = math.ceil(math.log2(total_hosts))
        prefix_len = 32 - host_bits
        num_addrs = 2 ** host_bits
        enriched.append((idx, name, devs, is_router, total_hosts, prefix_len, num_addrs))
    enriched.sort(key=lambda x: x[6], reverse=True)

    allocations = []
    current = int(base_net.network_address)
    limit = current + base_net.num_addresses

    for idx, name, devs, is_router, total, prefix, size in enriched:
        if current + size > limit:
            raise ValueError(f"Not enough address space for subnet '{name}'")
        net = ipaddress.IPv4Network((ipaddress.IPv4Address(current), prefix), strict=False)
        hosts = list(net.hosts())
        gateway = hosts[0] if len(hosts) >= 1 else None
        first = hosts[1] if len(hosts) >= 2 else None
        last = hosts[-1] if hosts else None
        allocations.append((idx, {
            'name': name,
            'network': f"{net.network_address}/{prefix}",
            'netmask': str(net.netmask),
            'broadcast': str(net.broadcast_address),
            'gateway': str(gateway) if gateway else 'N/A',
            'first_host': str(first) if first else 'N/A',
            'last_host': str(last) if last else 'N/A',
            'usable_hosts': devs,
            'allocated_size': size
        }))
        current += size

    allocations.sort(key=lambda x: x[0])
    return [alloc for _, alloc in allocations]


def write_results(lines, allocations):
    with open(INPUT_FILE, 'w', encoding='utf-8') as f:
        for line in lines:
            f.write(line)
        f.write('\nAsignación de subredes:\n')
        for alloc in allocations:
            f.write(f"Subnet: {alloc['name']}, {alloc['usable_hosts']}\n")
            f.write(f"Red/Prefijo: {alloc['network']}\n")
            f.write(f"Máscara: {alloc['netmask']}\n")
            f.write(f"Broadcast: {alloc['broadcast']}\n")
            f.write(f"Gateway: {alloc['gateway']}\n")
            f.write(f"Hosts válidos: {alloc['first_host']} - {alloc['last_host']}\n")
            f.write(f"Hosts requeridos: {alloc['usable_hosts']}\n")
            f.write(f"Direcciones totales: {alloc['allocated_size']}\n\n")


def process_file():
    with open(INPUT_FILE, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    base, reqs = parse_requirements(lines)
    allocations = calculate_subnets(base, reqs)
    write_results(lines, allocations)
    print('Archivo actualizado con subredes.')


def main():
    keyboard.add_hotkey('ctrl+alt+a', process_file)
    print('Presiona Ctrl+Alt+A para procesar el archivo.')
    threading.Event().wait()

if __name__ == '__main__':
    main()