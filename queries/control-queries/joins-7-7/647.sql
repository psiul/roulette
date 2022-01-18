select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 578 and cd.cd_hash <= 911 and hd.hd_hash >= 459 and hd.hd_hash <= 859 and a.ca_hash >= 15 and a.ca_hash <= 765
;
