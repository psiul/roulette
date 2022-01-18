select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,item i,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 251 and c.c_hash <= 651 and hd.hd_hash >= 312 and hd.hd_hash <= 645 and cd.cd_hash >= 93 and cd.cd_hash <= 843
;
