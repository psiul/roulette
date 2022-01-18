select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,date_dim d,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 355 and c.c_hash <= 755 and hd.hd_hash >= 489 and hd.hd_hash <= 822 and a.ca_hash >= 199 and a.ca_hash <= 949
;
