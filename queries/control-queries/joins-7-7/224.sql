select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and a.ca_hash >= 136 and a.ca_hash <= 536 and cd.cd_hash >= 69 and cd.cd_hash <= 819 and d.d_hash >= 582 and d.d_hash <= 915
;
