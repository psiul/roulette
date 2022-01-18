select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 67 and ss.ss_hash <= 467 and hd.hd_hash >= 71 and hd.hd_hash <= 404 and i.i_hash >= 24 and i.i_hash <= 774
;
