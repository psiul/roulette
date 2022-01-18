select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 656 and ss.ss_hash <= 989 and hd.hd_hash >= 105 and hd.hd_hash <= 505 and i.i_hash >= 132 and i.i_hash <= 882
;
