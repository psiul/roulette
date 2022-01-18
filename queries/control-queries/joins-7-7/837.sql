select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 628 and d.d_hash <= 961 and c.c_hash >= 132 and c.c_hash <= 882 and a.ca_hash >= 531 and a.ca_hash <= 931
;
