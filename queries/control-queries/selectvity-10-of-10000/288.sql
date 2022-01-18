select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 690 and ss.ss_hash <= 790 and i.i_hash >= 588 and i.i_hash <= 788 and hd.hd_hash >= 889 and hd.hd_hash <= 939
;
