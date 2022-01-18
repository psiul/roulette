select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 525 and hd.hd_hash <= 858 and c.c_hash >= 373 and c.c_hash <= 773 and a.ca_hash >= 158 and a.ca_hash <= 908
;
