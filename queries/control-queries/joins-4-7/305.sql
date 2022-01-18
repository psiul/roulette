select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 366 and ss.ss_hash <= 699 and c.c_hash >= 242 and c.c_hash <= 992 and i.i_hash >= 594 and i.i_hash <= 994
;
