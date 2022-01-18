select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 364 and ss.ss_hash <= 697 and c.c_hash >= 68 and c.c_hash <= 818 and a.ca_hash >= 551 and a.ca_hash <= 951
;