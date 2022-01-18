select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 95 and c.c_hash <= 495 and hd.hd_hash >= 64 and hd.hd_hash <= 814 and i.i_hash >= 267 and i.i_hash <= 600
;
