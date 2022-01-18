select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 597 and ss.ss_hash <= 997 and c.c_hash >= 243 and c.c_hash <= 993 and d.d_hash >= 219 and d.d_hash <= 552
;
