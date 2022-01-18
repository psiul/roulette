select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 335 and ss.ss_hash <= 835 and c.c_hash >= 786 and c.c_hash <= 886 and i.i_hash >= 606 and i.i_hash <= 806
;
