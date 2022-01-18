select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 588 and d.d_hash <= 921 and c.c_hash >= 258 and c.c_hash <= 658 and cd.cd_hash >= 229 and cd.cd_hash <= 979
;
