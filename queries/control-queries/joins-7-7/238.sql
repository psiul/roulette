select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 174 and i.i_hash <= 924 and d.d_hash >= 181 and d.d_hash <= 514 and hd.hd_hash >= 358 and hd.hd_hash <= 758
;
