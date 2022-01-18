select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 171 and ss.ss_hash <= 921 and d.d_hash >= 326 and d.d_hash <= 659 and i.i_hash >= 155 and i.i_hash <= 555
;
