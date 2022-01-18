select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 126 and d.d_hash <= 876 and c.c_hash >= 169 and c.c_hash <= 569 and a.ca_hash >= 583 and a.ca_hash <= 916
;
