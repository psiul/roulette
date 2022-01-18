select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 314 and ss.ss_hash <= 647 and i.i_hash >= 591 and i.i_hash <= 991 and hd.hd_hash >= 120 and hd.hd_hash <= 870
;
