select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 1 and i.i_hash <= 334 and a.ca_hash >= 11 and a.ca_hash <= 761 and d.d_hash >= 547 and d.d_hash <= 947
;
