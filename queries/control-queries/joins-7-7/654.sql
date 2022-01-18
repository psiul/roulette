select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 140 and hd.hd_hash <= 540 and c.c_hash >= 35 and c.c_hash <= 785 and d.d_hash >= 327 and d.d_hash <= 660
;
