select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 303 and ss.ss_hash <= 703 and hd.hd_hash >= 121 and hd.hd_hash <= 454 and i.i_hash >= 56 and i.i_hash <= 806
;
