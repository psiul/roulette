select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 138 and ss.ss_hash <= 471 and hd.hd_hash >= 199 and hd.hd_hash <= 949 and c.c_hash >= 378 and c.c_hash <= 778
;
