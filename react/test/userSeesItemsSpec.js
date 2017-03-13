import ItemList from '../src/components/ItemList';

describe('Items Index', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('items/itemsIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the items homepage', () => {
    beforeEach(() => {
      wrapper = mount(
        <ItemList />
      );
    });

    it('has the items names', done => {
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch('Item One');
        expect(pageText).toMatch('Item Two');
        expect(pageText).not.toMatch('item viral');

        done();
      },0);
    });
  });
});
