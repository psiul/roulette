select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_demographics cd,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 417 and hd.hd_hash <= 750 and i.i_hash >= 151 and i.i_hash <= 901 and cd.cd_hash >= 448 and cd.cd_hash <= 848
;
