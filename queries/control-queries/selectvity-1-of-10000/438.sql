select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 673 and ss.ss_hash <= 693 and i.i_hash >= 344 and i.i_hash <= 394 and c.c_hash >= 798 and c.c_hash <= 898
;
