select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 361 and ss.ss_hash <= 761 and d.d_hash >= 65 and d.d_hash <= 815 and cd.cd_hash >= 150 and cd.cd_hash <= 483
;
