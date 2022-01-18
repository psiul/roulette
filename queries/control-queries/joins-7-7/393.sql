select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 484 and cd.cd_hash <= 817 and hd.hd_hash >= 224 and hd.hd_hash <= 974 and d.d_hash >= 494 and d.d_hash <= 894
;