select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 187 and ss.ss_hash <= 937 and d.d_hash >= 360 and d.d_hash <= 693 and cd.cd_hash >= 4 and cd.cd_hash <= 404
;
