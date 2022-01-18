select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 170 and i.i_hash <= 570 and d.d_hash >= 160 and d.d_hash <= 493 and a.ca_hash >= 116 and a.ca_hash <= 866
;