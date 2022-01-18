select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 132 and ss.ss_hash <= 882 and c.c_hash >= 3 and c.c_hash <= 403 and d.d_hash >= 416 and d.d_hash <= 749
;
