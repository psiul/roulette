select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 214 and ss.ss_hash <= 614 and c.c_hash >= 563 and c.c_hash <= 896 and i.i_hash >= 169 and i.i_hash <= 919
;
