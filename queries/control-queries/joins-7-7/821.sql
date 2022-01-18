select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 163 and ss.ss_hash <= 563 and d.d_hash >= 174 and d.d_hash <= 924 and cd.cd_hash >= 112 and cd.cd_hash <= 445
;
