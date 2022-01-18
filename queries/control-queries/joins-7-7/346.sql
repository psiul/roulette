select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 551 and ss.ss_hash <= 951 and i.i_hash >= 234 and i.i_hash <= 984 and hd.hd_hash >= 265 and hd.hd_hash <= 598
;
