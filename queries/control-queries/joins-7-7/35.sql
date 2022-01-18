select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 249 and d.d_hash <= 649 and cd.cd_hash >= 231 and cd.cd_hash <= 981 and i.i_hash >= 532 and i.i_hash <= 865
;
