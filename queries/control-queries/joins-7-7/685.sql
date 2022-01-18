select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 159 and ss.ss_hash <= 559 and i.i_hash >= 134 and i.i_hash <= 884 and c.c_hash >= 186 and c.c_hash <= 519
;
