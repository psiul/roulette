select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 310 and ss.ss_hash <= 710 and cd.cd_hash >= 363 and cd.cd_hash <= 696 and d.d_hash >= 96 and d.d_hash <= 846
;
