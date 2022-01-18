select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 531 and ss.ss_hash <= 864 and cd.cd_hash >= 105 and cd.cd_hash <= 855 and i.i_hash >= 445 and i.i_hash <= 845
;
