select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 173 and cd.cd_hash <= 923 and c.c_hash >= 558 and c.c_hash <= 958 and hd.hd_hash >= 604 and hd.hd_hash <= 937
;
