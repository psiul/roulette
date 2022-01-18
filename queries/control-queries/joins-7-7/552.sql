select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 323 and ss.ss_hash <= 656 and d.d_hash >= 400 and d.d_hash <= 800 and cd.cd_hash >= 182 and cd.cd_hash <= 932
;
