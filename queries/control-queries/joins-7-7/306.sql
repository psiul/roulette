select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 310 and ss.ss_hash <= 710 and c.c_hash >= 194 and c.c_hash <= 527 and d.d_hash >= 171 and d.d_hash <= 921
;
