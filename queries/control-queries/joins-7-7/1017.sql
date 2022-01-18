select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 145 and d.d_hash <= 545 and c.c_hash >= 235 and c.c_hash <= 568 and a.ca_hash >= 10 and a.ca_hash <= 760
;
