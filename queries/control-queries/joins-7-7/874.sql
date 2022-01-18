select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 84 and c.c_hash <= 834 and i.i_hash >= 524 and i.i_hash <= 924 and a.ca_hash >= 595 and a.ca_hash <= 928
;
