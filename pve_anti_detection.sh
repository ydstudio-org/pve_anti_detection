#!/bin/bash
echo "Powered By Ydstudio(https://studio.yhdzz.cn/)"
ARGS_STRING="args: -cpu 'host,-hypervisor,+kvm_pv_unhalt,+kvm_pv_eoi,hv_spinlocks=0x1fff,hv_vapic,hv_time,hv_reset,hv_vpindex,hv_runtime,hv_relaxed,kvm=off,hv_vendor_id=intel'"

read -p "Input A VM id:" input

if [[ $input =~ ^[0-9]+$ ]]; then
  VMID=$input
else
  echo "Invalid input. Please enter a numeric VM ID."
  exit 1
fi

echo $ARGS_STRING >> /etc/pve/qemu-server/$VMID.conf
