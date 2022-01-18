select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 556 and ss.ss_hash <= 756 and i.i_hash >= 474 and i.i_hash <= 974
;
