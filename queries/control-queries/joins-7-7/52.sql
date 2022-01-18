select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 62 and d.d_hash <= 462 and i.i_hash >= 385 and i.i_hash <= 718 and a.ca_hash >= 149 and a.ca_hash <= 899
;
