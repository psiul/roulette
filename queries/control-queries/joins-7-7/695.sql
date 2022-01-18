select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 163 and cd.cd_hash <= 913 and a.ca_hash >= 82 and a.ca_hash <= 482 and hd.hd_hash >= 419 and hd.hd_hash <= 752
;