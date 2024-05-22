import os
import argparse
import requests
import json

def do_ping_sweep(ip, num_of_host):
    ip_parts = ip.split('.')
    network_ip = ip_parts[0] + '.' + ip_parts[1] + '.' + ip_parts[2] + '.'
    scanned_ip = network_ip + str(int(ip_parts[3]) + num_of_host)
    response = os.popen(f'ping -c 1 {scanned_ip}')
    res = response.readlines()
    print(f" Result of scanning: {scanned_ip} \n{res[1]}", end='\n')

def sent_http_request(target, method, headers=None, payload=None):
    headers_dict = dict()
    if headers:
        for header in headers:
            header_name = header.split(':')[0]
            header_value = header.split(':')[1:]
            headers_dict[header_name] = ':'.join(header_value)
    if method == "GET":
        response = requests.get(target, headers=headers_dict)
    elif method == "POST":
        response = requests.post(target, headers=headers_dict, data=payload)
    else:
        print(f"Не выбран метод GET или POST для ресурса {target}")
        return
    print(
        f" Response status code: {response.status_code}\n"
        f" Response headers: {json.dumps(dict(response.headers), indent=4, sort_keys=True)}\n"
        f" Response content:\n {response.text}"
    )

parser = argparse.ArgumentParser(description='Network scanner')
parser.add_argument('task', choices=['scan', 'sendhttp'], help='Network scan or send HTTP request')
parser.add_argument('-i', '--ip', type=str, help='IP address')
parser.add_argument('-n', '--num_of_hosts', type=int, help='Number of hosts')
parser.add_argument('-t', '--target', type=str, help='URL')
parser.add_argument('-m', '--method', type=str, help='Method')
parser.add_argument('-hd', '--headers', type=str, nargs='*', help='Headers')
args = parser.parse_args()

if args.task == 'scan':
    for host_num in range(args.num_of_hosts):
        do_ping_sweep(args.ip, host_num)
elif args.task == 'sendhttp':
    sent_http_request(args.target, args.method, args.headers)
