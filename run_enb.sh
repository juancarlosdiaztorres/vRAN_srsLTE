#!/bin/sh
sleep 5
srsenb /config/enb.conf --enb.name=dummyENB01 --enb.mcc=722 --enb.mnc=07 --enb.enb_id=18AF1 --enb.tac=0x1234 --enb.cell_id=01 --enb.mme_addr=172.30.2.21 --enb.gtp_bind_addr=172.30.2.30 --enb.s1c_bind_addr=172.30.2.30 --enb_files.rr_config=/config/rr.conf --enb_files.sib_config=/config/sib.conf --enb_files.drb_config=/config/drb.conf --pcap.enable=true 

