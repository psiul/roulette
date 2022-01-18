select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 449 and ss.ss_hash <= 782 and hd.hd_hash >= 426 and hd.hd_hash <= 826 and i.i_hash >= 220 and i.i_hash <= 970
;
