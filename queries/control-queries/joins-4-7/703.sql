select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 652 and ss.ss_hash <= 985 and hd.hd_hash >= 420 and hd.hd_hash <= 820 and cd.cd_hash >= 153 and cd.cd_hash <= 903
;
