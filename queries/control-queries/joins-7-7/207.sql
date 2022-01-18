select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 217 and cd.cd_hash <= 550 and hd.hd_hash >= 468 and hd.hd_hash <= 868 and d.d_hash >= 61 and d.d_hash <= 811
;
