select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 469 and ss.ss_hash <= 869 and c.c_hash >= 167 and c.c_hash <= 500 and cd.cd_hash >= 96 and cd.cd_hash <= 846
;
