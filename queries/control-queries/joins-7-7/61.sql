select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 317 and d.d_hash <= 650 and hd.hd_hash >= 446 and hd.hd_hash <= 846 and a.ca_hash >= 137 and a.ca_hash <= 887
;
